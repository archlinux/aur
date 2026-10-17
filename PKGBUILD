# Maintainer: Davide Carnemolla <cdavide98carnemolla@gmail.com>
# Template rendered by scripts/render-manifests.sh and pushed to the AUR as texoria-bin by the
# release workflow. Keep depends in sync with crates/texoria/packaging/linux/nfpm.yaml.
pkgname=texoria-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='An elegant, fast LaTeX editor'
arch=('x86_64' 'aarch64')
url='https://github.com/Herbrant/TeXoria'
license=('MIT')
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
sha256sums_x86_64=('81c186a67bdf7738460dd998e92bf87aab92d58f3502b74d9794f179904b6bfb')
sha256sums_aarch64=('987d80db3df7ce5e177ae9add075d7aaa475bd6361c62ed4899389dab5c42b84')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
