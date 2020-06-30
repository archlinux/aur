# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=gog-we-are-the-dwarves
pkgver=2.2.0.4
_pkgtag=$pkgver
pkgrel=1
pkgdesc="An action-based tactical adventure with active pause (extreme slowdown of time) placing you in control of three Dwarven astronauts."
arch=('x86_64')
url="https://www.gog.com/game/we_are_the_dwarves"
license=('custom')
depends=('libx11' 'libxinerama' 'libxcursor' 'libxrandr' 'libxi' 'alsa-lib' 'libpulse' 'libglvnd' 'glibc')
source=("gogdownloader://we_are_the_dwarves/en3installer4"
        "We are the Dwarves.desktop"
        "start-we-are-the-dwarves.sh")
sha512sums=('5a6b5dffa1be9e24b7eae0932cd0f063189e9be746800d00bc880d3ad7ae51df15d268e978c36ac3a9c8e8c0f0cea25f15e480afddc064f22d42e38996cad01d'
            'd537996628ba1f4c8b492101ad3d4f3353ebd6c5a3042d6376521a7d10ea180025468b10b60f2d43d65d4221cedbba2e2560d0d7aa1a708e28e86e647f156cdc'
            '8689653f539f8ae75920717e71bead644f5934d7bc575072d7fc00b1d30be5cc68cd7cb221e9ebeb6c94674d7afd887025ffd494fe2dae36fc55cebc47769517')

package()
{
  mkdir -p "${pkgdir}/opt/$pkgname"
  cp -r "${srcdir}/data/noarch/game" -T "${pkgdir}/opt/$pkgname"
  chmod -R 644 "${pkgdir}/opt/$pkgname/"
  chmod    755 "${pkgdir}/opt/$pkgname/watd.x86_64"
  find "${pkgdir}/opt/$pkgname" -type d -exec chmod 755 {} \;
  install -Dm 755 "${srcdir}/start-we-are-the-dwarves.sh" "${pkgdir}/usr/bin/we-are-the-dwarves"
  install -Dm 755 "${srcdir}/We are the Dwarves.desktop" "$pkgdir/usr/share/applications/We are the Dwarves.desktop"
  install -Dm 644 "${srcdir}/data/noarch/support/icon.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png"
  install -Dm 644 "${srcdir}/data/noarch/docs/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
