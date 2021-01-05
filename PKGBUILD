# Maintainer: Mounir Erhili <mounirerhili@gmail.com>
# Check for new Linux releases in: https://dbeaver.io/download/

pkgname=dbeaver-ce-latest-deb
pkgver=7.3.2
pkgrel=1
pkgdesc='DBeaver Community Edition, Universal Database Manager and SQL Client'
arch=('x86_64')
url='https://dbeaver.io'
license=('GPL')
depends=('java-runtime' 'gtk3' 'gtk-update-icon-cache' 'libsecret')
conflicts=('dbeaver' 'dbeaver-ee')
optdepends=('dbeaver-plugin-apache-poi: DBeaver library for Microsoft Office documents'
  'dbeaver-plugin-batik: DBeaver library for SVG format'
  'dbeaver-plugin-bouncycastle: Bouncy Castle library for DBeaver plugin for SSHv2 tunnels'
  'dbeaver-plugin-office: export data in Microsoft Office Excel format'
  'dbeaver-plugin-sshj: DBeaver plugin for SSHv2 tunnels with Bouncy Castle algorithm'
  'dbeaver-plugin-sshj-lib: SSHv2 library for Java for DBeaver plugin for SSHv2 tunnels'
  'dbeaver-plugin-svg-format: save diagrams in SVG format')
source=("https://dbeaver.io/files/${pkgver}/dbeaver-ce_${pkgver}_amd64.deb")
sha256sums=('b919ccc2cf754efa0e46d8802442a5bea4e8a7743ad86d0427ab180bd39cc0f7')

package() {
  msg2 'Extracting the data.tar.gz...'
  bsdtar -xf data.tar.gz -C "$pkgdir/"

  msg2 'Moving stuff in place...'
  # Launcher
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/usr/share/dbeaver/dbeaver" "$pkgdir/usr/bin/dbeaver-ce"
  chmod +x "$pkgdir/usr/share/dbeaver/dbeaver"
  mv "$pkgdir/usr/share/applications/dbeaver.desktop" "$pkgdir/usr/share/applications/dbeaver-ce.desktop"
}
