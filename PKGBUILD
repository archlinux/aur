# Maintainer: Davide Carnemolla <cdavide98carnemolla@gmail.com>
# Template rendered by scripts/render-manifests.sh and pushed to the AUR as texoria-bin by the
# release workflow. Keep depends in sync with crates/texoria/packaging/linux/nfpm.yaml.
pkgname=texoria-bin
pkgver=0.3.0
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
sha256sums_x86_64=('0505ed5b9f417187abf8031dfb49e4f218717fde708e4d8a211123feab1e5b71')
sha256sums_aarch64=('7dbd8da5c57df8a51ce30abb39e229b4c81fcaf34e60a17ecd4f7fcfeaf4fe10')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
