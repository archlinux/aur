# Maintainer: CxOrg <clx.org@cloud-org.uk>
pkgname=pam-fprint-helper
pkgver=1.0
pkgrel=1
pkgdesc="Fingerprint authorization (pam_fprintd) for privileged access on Arch/KDE Plasma: polkit, sudo, su, login, SDDM/LightDM, themed root GUI apps"
arch=('any')
url="https://github.com/ixnewton/PamFprint"
license=('GPL-3.0-or-later')
depends=('bash' 'fprintd' 'polkit')
optdepends=(
  'krusader: root file-manager launcher'
  'ksystemlog: root system-log viewer launcher'
  'zenmap: root network-scanner launcher'
)
install=$pkgname.install
_commit=65dac5f2ee4ba47393755c8de22adf2786ec571d
source=("$pkgname-$pkgver.tar.gz::https://github.com/ixnewton/PamFprint/archive/$_commit.tar.gz")
sha256sums=('60504f1a8ae6c7a304422c97dcc1d7d85444a648125e0b99702d3053083ce438')

package() {
  cd "$srcdir/PamFprint-$_commit"
  install -dm755 "$pkgdir/usr/share/pamfprint"
  cp -a files install.sh uninstall.sh README.md "$pkgdir/usr/share/pamfprint/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
