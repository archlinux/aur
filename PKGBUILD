# Maintainer: melvyn2 <melvyn2 at brcok dot tk>
pkgname=plasma5-shader-wallpaper
pkgver=r67.d108ed7
pkgrel=1
pkgdesc="Plasma animated shader wallpaper plugin"
arch=(any)
url="https://github.com/y4my4my4m/kde-shader-wallpaper"
license=(GPL)
depends=(plasma-desktop)
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
   cd "${srcdir}/kde-shader-wallpaper"
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p "${pkgdir}/usr/share/plasma/wallpapers/online.knowmad.shaderwallpaper"
    cp "${srcdir}/kde-shader-wallpaper/metadata.desktop" "${pkgdir}/usr/share/plasma/wallpapers/online.knowmad.shaderwallpaper"
    cp -r "${srcdir}/kde-shader-wallpaper/contents" "${pkgdir}/usr/share/plasma/wallpapers/online.knowmad.shaderwallpaper"
}
