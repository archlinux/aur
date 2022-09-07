# Maintainer: QiE2035 <qie2035@qq.com>

pkgname="use-system-electron19"
pkgver=19
pkgrel=1
pkgdesc="Symlinks the system's electron to all existing versions."
arch=("any")
license=("Unlicense")
depends=("electron19")
conflicts=("electron" "electron3" "electron4" "electron5" "electron6" "electron7" "electron8" "electron9" "electron10" "electron11" "electron12" "electron13" "electron14" "electron15" "electron16" "electron17" "electron18")
provides=("electron" "electron3" "electron4" "electron5" "electron6" "electron7" "electron8" "electron9" "electron10" "electron11" "electron12" "electron13" "electron14" "electron15" "electron16" "electron17" "electron18" "electron19")

package() {
  install -dm755 "${pkgdir}/usr/bin"
  for num in {2..18}; do
    ln -s /usr/bin/electron19 "electron${num}"
    mv "electron$num" "${pkgdir}/usr/bin/"
  done
  ln -s /usr/bin/electron19 "electron"
  mv "electron" "${pkgdir}/usr/bin/"
}
