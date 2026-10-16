# Maintainer: Davide Carnemolla <cdavide98carnemolla@gmail.com>
# Template rendered by scripts/render-manifests.sh and pushed to the AUR as texoria-bin by the
# release workflow. Keep depends in sync with crates/texoria/packaging/linux/nfpm.yaml.
pkgname=texoria-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='An elegant, fast LaTeX editor'
arch=('x86_64' 'aarch64')
url='https://github.com/Herbrant/TeXoria'
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'fontconfig' 'freetype2'
  'wayland' 'vulkan-icd-loader' 'hicolor-icon-theme')
optdepends=('git: source control'
  'texlive-binextra: latexmk, to typeset with TeX Live instead of the bundled Tectonic'
  'texlive-latexextra: more LaTeX packages'
  'vulkan-driver: GPU rendering')
provides=('texoria')
conflicts=('texoria')
options=('!strip' '!debug')
source_x86_64=("$url/releases/download/v$pkgver/texoria-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/texoria-$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('cf1d57ba846f7f9934a7b4e2d6c819413b2558d5f5d7f53204977353cc37452f')
sha256sums_aarch64=('f7893cca4d3866109e1c629efc0ac94e47d2424a3c63d44b0f18a3f740aba37e')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
