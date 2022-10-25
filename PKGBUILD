# Maintainer: onedwide <one-d-wide@protonmail.com>
pkgname=systemd-hosts.d
pkgver=0.4
pkgrel=2
pkgdesc='Keep your hosts records in logically separated files'
url='https://github.com/one-d-wide/systemd-hosts.d'
arch=('any')
license=(GPL3)
depends=('filesystem' 'systemd')
makedepends=('git')
install=$pkgname.install

source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "0.%s" "$(git rev-list --count HEAD)"
}

package() {
    cd "$pkgname"
    mkdir -pm755 "$pkgdir/etc/hosts.d"
    install -Dm644 systemd-hosts.d.{path,service} -t "$pkgdir"/usr/lib/systemd/system
}
