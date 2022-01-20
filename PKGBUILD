
pkgname=python-minq-storage-git
pkgver=r52.edcaceead2de88fb8f5a412aa9f0dc1f42311c53
pkgrel=1
pkgdesc='Python package for caching network requests'
arch=('any')
url='https://github.com/kuche1/minq-storage'
license=()
depends=('python' 'yt-dlp' 'viu' 'vlc')
makedepends=('python-setuptools' 'python-pip')
provides=('python-minq-storage')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd $srcdir/minq-storage
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse HEAD)"
}

check() {
    cd $srcdir/minq-storage
    #python3 setup.py check
}

package() {
    cd $srcdir/minq-storage
    #python setup.py install --root="$pkgdir/" --optimize=1
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps .
}
