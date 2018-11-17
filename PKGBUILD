# Comaintainer: pancho horrillo <pancho at pancho dot name>
# Maintainer: Brian Bidulock <bidulock at openss7 dot org>
# Contributor: Bernardo Barros <mail-*-AT-*-bbarros.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Truls Becken <becken@stud.ntnu.no>
# Contributor: whompus

# Based on xdm-archlinux

pkgname=xdm-minimalist
pkgver=0.2
pkgrel=2
pkgdesc="a minimalist xdm setup."
arch=(any)
license=('GPL')
url="http://xorg.freedesktop.org"
depends=('xorg-xdm' 'bash'
	 'xorg-xmessage' 'xorg-xclock' 'xorg-xsetroot' 'xorg-xwininfo' 'xorg-xkill' 'terminus-font')
optdepends=('systemd-sysvcompat: if you use systemd')
backup=(etc/X11/xdm/minimalist/Xsetup
	etc/X11/xdm/minimalist/Xresources)
install=xdm-minimalist.install
source=(xdm-config
	Xsetup
	Xstartup
	Xresources
	buttons
	xdm-minimalist.service)
sha512sums=('9f363425d331dd52d54350e677004227048c0e1e3a373cf28f17b84cc19af261d05c3254161c43d8e37dc9bcfce7947589d102751beb00a33dbbee7a159707ce'
            '07753a2a538ff18fed5f8501fbf4def2d2cb11170c3d38e10c4c506dbbaf3c03c8585d7250dee68bc9dadd673814be9d55e6e68f9abc611adb22534fdec2bb68'
            '72d3a9c18e6ed1a7906840d9cbcffd45f11b416e13228875c9ecc2603cef9c51535e0fe4ab57658f070f0e7241cd844e2bc652b09fcdc3b5c288ac2ec5bd571d'
            'cd58a3524e6040664f45b188a95a3af3b48b2536a55f36a2e033c9695c849d71ff0ca1208f1ed092653a83ec6837815cd063bfc995b74c0fd8a0fa67ae16ecb1'
            'e501b934761a9bb780f16d46801789ff668a21429d67403c1867a6b9bae19a9bfbf71342b5534547fa54d8d79846d5235d7543ba85430e3b4e6e79ac7768d4f8'
            '5de4629d0bfa890be30817b8549ea27c762b258e6dbba41d56f5ff43971e67a8011e9ef0d8a5065e8e7ebb090b31c28ff24cf40d569f15d3135befd84f388d30')

package() {
  mkdir -p "$pkgdir"/etc/X11/xdm/minimalist
  cp buttons xdm-config Xresources Xsetup Xstartup "$pkgdir"/etc/X11/xdm/minimalist
  chmod 0755 "$pkgdir"/etc/X11/xdm/minimalist/{Xsetup,Xstartup,buttons}
  install -Dm0644 "$srcdir"/xdm-minimalist.service "$pkgdir"/usr/lib/systemd/system/xdm-minimalist.service
}
