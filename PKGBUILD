# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com>

pkgname=drivesync
pkgver=1.3.2
pkgrel=1
pkgdesc='Google Drive synchronization for Linux'
arch=('any')
url='https://github.com/MStadlmeier/drivesync'
license=('MIT')
depends=('ruby>=2.5.0' 'ruby<2.6.0')
makedepends=('ruby-bundler')
source=("https://github.com/MStadlmeier/$pkgname/archive/$pkgver.tar.gz"
        'drivesync')
sha512sums=('c31554c1ba5c0ff48757e153860a3ce8acd050b07373c087d81ee0b15164215658341202db6211987e6c9e576756304eec4eafbbf8bdd68560ffa9cc0b60aca0'
            'ee46c6dcff180f581bbe0f80991f5b6fc0403683fe9e28e19d2263b9f6b93e71d90a70ff2def3d79d0635477fc7ebeac585be43ec4c2696615063cdd0fcf75dd')

build() {
    cd "$pkgname-$pkgver"
    bundle install --no-cache --deployment
}

package() {
    install -D -m755 'drivesync' "$pkgdir/usr/bin/drivesync"
    install -d -m755 "$pkgdir/usr/share/drivesync"
    
    cd "$pkgname-$pkgver"
    cp -r * "$pkgdir/usr/share/drivesync/"
}
