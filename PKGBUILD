pkgname="revssl-git"
pkgver=r5.bd64eca
pkgrel=1
pkgdesc='simple script that automates generation of OpenSSL reverse shells'
arch=('any')
url='https://github.com/TheSecondSun/Revssl'
license=('MIT')
source=('git+https://github.com/TheSecondSun/Revssl.git')
md5sums=('SKIP')

pkgver() {
  cd Revssl
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/Revssl"
    install -Dm755 revssl.sh "$pkgdir/usr/bin/revssl.sh"
}
