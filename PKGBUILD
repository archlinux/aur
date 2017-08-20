# Maintainer: Pablo Lezaeta Reyes <prflr88 arro'a gmail puntocom>

pkgname=ubuntu-kylin-theme
pkgver=1.7.0
pkgrel=1
pkgdesc="The official theme for Ubuntu Kylin"
arch=('any')
url="https://launchpad.net/ubuntukylin-theme"
license=('custom:GPL3')
depends=('gnome-icon-theme' 'hicolor-icon-theme' 'ttf-droid') # 'ubuntu-mono')
#makedepends=('')
optdepends=('plymouth: Contrain a theme for this login splash screen'
	'grub: Contain a theme for this bootloader manager'
	'lightdm-unity-greeter: Contain a theme for this lightdm greeter'
	'chinese-calendar: Official calendary for Ubuntu Kylin')
source=("https://launchpad.net/ubuntu/+archive/primary/+files/ubuntukylin-theme_$pkgver.tar.xz")
sha256sums=('d1f9087e67b0c39c55b7a63f013472f05d3228eba99db295494d392b4540e876')

package() {
  cd "ubuntukylin-theme-${pkgver}"

  mkdir -p "${pkgdir}/usr/share/"  
  cp -rv --no-preserve=ownership kylin-greeter	"${pkgdir}/usr/share/"
  cp -rv --no-preserve=ownership usr/share/fcitx-qimpanel "${pkgdir}/usr/share/"
  cp -rv --no-preserve=ownership usr/share/plymouth "${pkgdir}/usr/share/"

  mkdir -p "${pkgdir}/usr/share/icons/"
  cp -rv --no-preserve=ownership ubuntukylin-icon-theme "${pkgdir}/usr/share/icons/"
  cp -rv --no-preserve=ownership ukui-icon-theme "${pkgdir}/usr/share/icons/"

  mkdir -p "${pkgdir}/usr/share/themes/"
  cp -rv --no-preserve=ownership ubuntukylin-theme "${pkgdir}/usr/share/themes/"
  cp -rv --no-preserve=ownership ukui-theme "${pkgdir}/usr/share/themes/"

  mkdir -p "${pkgdir}/usr/share/grub/themes/"
  cp -rv --no-preserve=ownership ubuntukylin-grub-theme "${pkgdir}/usr/share/grub/themes/"

  mkdir -p "${pkgdir}/usr/share/glib-2.0/schemas/"
  cp -rv --no-preserve=ownership debian/25_ubuntukylin-theme.gschema.override "${pkgdir}/usr/share/glib-2.0/schemas/"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp -rv --no-preserve=ownership debian/copyright "${pkgdir}/usr/share/licenses/${pkgname}/"

  mkdir -p "${pkgdir}/usr/share/unity-greeter/"
  cp -rv --no-preserve=ownership ubuntukylin-unity-greeter/ubuntukylin-logo.png "${pkgdir}/usr/share/unity-greeter/"
}

