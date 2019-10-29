# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=pantheon-lite
pkgver=4
pkgrel=1
pkgdesc='Pantheon Lite Session (replaces Gala with Openbox & Compton)'
arch=('any')
url='https://bbs.archlinux.org/viewtopic.php?pid=1402016#p1402016'
license=('GPL3')
groups=('pantheon-qq')
depends=('openbox' 'compton' pantheon-{workarounds,session}
         'wingpanel-standalone-git')
optdepends=("obconf: openbox configuration utility"
            "elementary-os-openbox: Elementary theme for Openbox"
            "hsetroot: Set X11 background"
            "xorg-xwininfo: set mousewheel transparency scrolling like compiz with compton-trans"
            "dbus: set window color inversion with compton-inverter (must enable dbus backend in compton)")
source=(pantheon-openbox.{desktop,session} 
        compton-{dbus.desktop,inverter} 
        obsession{,.desktop}
        {rc,menu}.xml)
sha512sums=('6cb25616a1fd238040f81eb8ed2c26f35fa9d9648c2b551df7e3bc2d56726d41d8bf08445b36cbb5b5f5412a4d2c06e09132d6cddcdba0d877d53a9fe97febab'
            'b1b7d5e18795a727e4dc7430a1c7b3d417617cdd6dc0dc244ae27d8b358c5c8e1ab077a20b94743cfe0b6e1cec2f98f9fe69fcaee6776519cbc57dc1b80edfec'
            '0917b70b9811e8f4a61a5f962f9103c378385d58f2b5b62c770ed0d3f75874aa0678be468270c370248f5e24279208c38fabbff704da1ed9b67c07d8cb0becc2'
            '8696b95b4f6b37c9edddcdbef95300d0651d56b12cf1238204874aa625a37c84a30b324b08bdfbe67735785eea2c448e09ad3e2028c0f6058b02b7d4cf665e7c'
            'bced06b79cd47f2425943603dca42620cbd1c943ffbc228f470750efb08346a1570b8193a3ca310206b88a8e3f58c9d12cf03c3aa78791944cd070dbd8a0383f'
            'c70588c4d844c8916a97c61fae40dab2a38527fa0d31c7261700766f2e784d642edccb1a64544b9dfdc0655dd5a6b872e9bf323029091656ae45b0924d15ea0e'
            'd138b755854d2b6242d6ec10b9c92efdc8505764b7f678223cf9241deba6727cc73001bdde6a2b10377e15b459d5b978e17829a56b5bc28d7385eba766974284'
            '500a6aea4fa1015cfffc37b8b2ec71c89e5be170197532848132e981dba6be8126f1e661e5be3ed9a19858a7af737c3ea989c0be605b0fbf3fe1d415b2e7042b')

package() {
  install -Dm644 {,"${pkgdir}"/usr/share/xsessions/}pantheon-openbox.desktop
  install -Dm644 {,"${pkgdir}"/usr/share/gnome-session/sessions/}pantheon-openbox.session
  install -Dm644 {,"${pkgdir}"/usr/share/applications/}compton-dbus.desktop
  install -Dm755 {,"${pkgdir}"/usr/bin/}compton-inverter
  install -Dm755 {,"${pkgdir}"/usr/bin/}obsession
  install -Dm644 {,"${pkgdir}"/usr/share/applications/}obsession.desktop
}
