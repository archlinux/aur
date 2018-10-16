# Maintainer: Juliette Monsel <j_4321@protonmail.com>
pkgname=foldersync
_name=FolderSync
pkgver=1.0.0
pkgrel=1
pkgdesc="Folder synchronisation software"
arch=('any')
url="https://github.com/j4321/$_name"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python' 'tk' 'desktop-file-utils')
optdepends=('libnotify: notification when the scan/sync is finished',
            'python-tkfilebrowser: nicer file browser',
            'zenity: nicer file browser',)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/j4321/$_name/archive/v$pkgver.tar.gz")
sha512sums=('c40605cdff483b84eb0c436cb7ab2eef7cae6acb2e2f5c6abcc153bf27957e9a68b2300ff37332ae0b8a8fccc74220b2c763fd0e771891216055611babb0a7fe')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}


