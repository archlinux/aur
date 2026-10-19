# Maintainer: Davide Carnemolla <cdavide98carnemolla@gmail.com>
# Template rendered by scripts/render-manifests.sh and pushed to the AUR as texoria-bin by the
# release workflow. Keep depends in sync with crates/texoria/packaging/linux/nfpm.yaml.
pkgname=texoria-bin
pkgver=0.4.2
pkgrel=1
pkgdesc='An elegant, fast LaTeX editor'
arch=('x86_64' 'aarch64')
url='https://github.com/Herbrant/TeXoria'
license=('MIT')
depends=('glibc' 'gcc-libs' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'fontconfig' 'freetype2'
  'wayland' 'vulkan-icd-loader' 'hicolor-icon-theme')
optdepends=('git: source control'
  'texlive-binextra: latexmk, to build with TeX Live instead of the bundled Tectonic'
  'texlive-latexextra: more LaTeX packages'
  'vulkan-driver: GPU rendering')
provides=('texoria')
conflicts=('texoria')
options=('!strip' '!debug')
source_x86_64=("$url/releases/download/v$pkgver/texoria-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/texoria-$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('b3153ea9a7297be4fcd43b6b0988a12998d3f26284d1579faf3cb0fcf767aa79')
sha256sums_aarch64=('fb8a4507d461f491e0c4f8715e6b6b8fdbaa0288aa5aac9503f73956e589d6b3')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
