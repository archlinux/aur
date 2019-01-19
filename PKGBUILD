# Maintainer: Jeff Henson <jeff at henson dot io>

_pluginname=TrayTotp
_svncommit=4
pkgname=keepass-plugin-traytotp
pkgver=2.0.0.5
pkgrel=3
pkgdesc="Plugin adding TOTP to KeePass2 tray menu, entry list and auto-type."
license=('GPL3')
depends=('keepass')
arch=('any')
url="http://sourceforge.net/projects/traytotp-kp2/"
source=("https://sourceforge.net/code-snapshots/svn/t/tr/traytotp-kp2/code/traytotp-kp2-code-r${_svncommit}-trunk.zip")
sha256sums=('eff8d54665c0eba226510e7b053ba1b424a45d8559da8fae4bbd13b3db1c17c3')

prepare() {
  cd "${srcdir}/traytotp-kp2-code-r${_svncommit}-trunk"
  mkdir build
  cp -r Properties Libraries Resources *.cs *.resx *.csproj build/
}

build() {
  keepass --plgx-create "${srcdir}/traytotp-kp2-code-r${_svncommit}-trunk/build"
}

package() {
  install -Dm644 "${srcdir}/traytotp-kp2-code-r${_svncommit}-trunk/build.plgx" "${pkgdir}/usr/share/keepass/plugins/${_pluginname}.plgx"
}
