# Maintainer: Juliette Monsel <j_4321@protonmail.com>
pkgname=foldersync
_name=FolderSync
pkgver=1.0.1
pkgrel=1
pkgdesc="Folder synchronisation software"
arch=('any')
url="https://github.com/j4321/$_name"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python' 'tk' 'gettext' 'desktop-file-utils')
optdepends=('libnotify: notification when the scan/sync is finished',
            'python-tkfilebrowser: nicer file browser',
            'zenity: nicer file browser',)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/j4321/$_name/archive/v$pkgver.tar.gz")
sha512sums=('b531491b4eaf39bfe31255c0725745d131036edbed8c9816ce87777d711213630c1a904b26bb47b7792aa3e490880d56fd97748b744a5679142369d4952c2a65')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}


