# Maintainer: Kieran Colford <kieran@kcolford.com>
pkgname=ddns
pkgver=1.2.0
pkgrel=1
epoch=
pkgdesc="Automatic provisioning of Dynamic DNS."
arch=('any')
url="https://github.com/kcolford/$pkgname"
license=('GPL')
groups=()
depends=('bash' 'bind-tools' 'coreutils' 'inetutils' 'sed' 'systemd')
makedepends=()
checkdepends=()
optdepends=('bind: for tsig-keygen'
	    'curl: for looking up your ip address'
	    'openssh: for updating SSHFP records')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('bae00de8466dcf96614649a0a15a835c')
noextract=()

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 ddns.sh "$pkgdir/usr/bin/ddns.sh"
  install -Dm644 systemd/ddns.service "$pkgdir/usr/lib/systemd/system/ddns.service"
  install -Dm644 systemd/ddns.timer "$pkgdir/usr/lib/systemd/system/ddns.timer"
  mkdir -pm700 "$pkgdir/etc/ddns/"
}

# vim:set ts=2 sw=2 et:
