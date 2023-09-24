# Maintainer: DaniD3v <nichtdu.login@gmail.com>

pkgname="jelly-drift-bin"
pkgdesc="Free racing game made by the youtuber Dani"
url="https://danidev.itch.io/jelly-drift"

pkgver="1.0.0"
pkgrel=8

license=("unknown")

source=("jelly-drift.desktop" "https://github.com/DaniD3v/aur-files/raw/main/JellyDrift.tar.xz")
arch=("x86_64")

sha256sums=("56279e3d77e2126a5886856923005d965c20b57d792142606badb71744423ab2" "364453f1d9f8250710d0e2c571c66922db93ee422aad33813a71914cc5eb757f")

package() {
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir "${pkgdir}/usr/bin"

  chmod +x "${srcdir}/JellyDrift/JellyDriftLinux.x86_64"
  cp -R "${srcdir}/JellyDrift" "${pkgdir}/usr/share"

  cp "${srcdir}/jelly-drift.desktop" "${pkgdir}/usr/share/applications"
  ln -s "${pkgdir}/usr/share/JellyDriftLinux/JellyDriftLinux.x86_64" "${pkgdir}/usr/bin/jellydrift"
}
