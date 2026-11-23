# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=mesa-aliveos
pkgver=26.3.1
pkgrel=2
pkgdesc="Open-source OpenGL and VA-API drivers (AliveOS patched Mesa, prebuilt release)"
url="https://github.com/Twilight0/mesa-aliveos"
arch=('x86_64')
license=('MIT AND BSD-3-Clause AND SGI-B-2.0')
depends=(
  'expat'
  'glibc'
  'libdrm'
  'libelf'
  'libgcc'
  'libglvnd'
  'libstdc++'
  'libx11'
  'libxcb'
  'libxext'
  'libxshmfence'
  'libxxf86vm'
  'llvm-libs'
  'lm_sensors'
  'spirv-tools'
  'wayland'
  'zlib'
  'zstd'
)
optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=(
  "mesa=1:${pkgver}-${pkgrel}"
  "libva-mesa-driver=1:${pkgver}-${pkgrel}"
  "mesa-libgl=1:${pkgver}-${pkgrel}"
  'libva-driver'
  'opengl-driver'
)
conflicts=(
  'mesa'
  'libva-mesa-driver'
  'mesa-libgl'
)
replaces=(
  'libva-mesa-driver<1:24.2.7-1'
  'mesa-libgl<17.0.1-2'
)
options=(!strip !debug)
noextract=("${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
source=(
  "https://github.com/Twilight0/mesa-aliveos/releases/download/v${pkgver}-${pkgrel}/${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
)
sha256sums=(
  '018233d94e28ed254ff9a0ca5b2726f3e430d9140a2d9992ab93e978ac8d5818'
)

package() {
  bsdtar -xf "${srcdir}/${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" \
    -C "${pkgdir}" \
    --exclude='.BUILDINFO' \
    --exclude='.MTREE' \
    --exclude='.PKGINFO'
}
