# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=containerhub
pkgver=0.0.0
pkgrel=1
pkgdesc="Your linux container is just one click away!"
arch=(any)
url="https://github.com/XenGi/containerhub"
license=('MIT')
groups=()
depends=('python>=3.6'
         'python-django>=1.10'
         'python-celery>=4.0.0'
         'python-docopt>=0.6.2')
optdepends=('python-sshpubkeys>=2.2.0')
#makedepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
options=(!emptydirs)
install=containerhub.install
source=("containerhub::git+https://github.com/xengi/containerhub/archive/v$pkgver.tar.gz")
sha1sums=()

prepare() {
    cd "$pkgname-$pkgver"
    #patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
    cd "$pkgname-$pkgver"
    #./configure --prefix=/usr
    #make
}

check() {
    cd "$pkgname-$pkgver"
    #make -k check
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=4 sw=4 et:
