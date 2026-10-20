# Maintainer: Davide Carnemolla <cdavide98carnemolla@gmail.com>
# Template rendered by scripts/render-manifests.sh and pushed to the AUR as texoria-bin by the
# release workflow. Keep depends in sync with crates/texoria/packaging/linux/nfpm.yaml.
pkgname=texoria-bin
pkgver=0.6.0
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
sha256sums_x86_64=('5a47424169d24292f4f79e2685e572ff3dd9a503a404e139ff913db624adfc6c')
sha256sums_aarch64=('5238918db63165d24322f6780a352cd8238b65fb631b6e134902f350f4a4d38f')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
