# Maintainer: Igor Deyashkin <igor_deyawka@mail.ru>

pkgname="git-igitt-bin"
pkgdesc="Interactive Git terminal application to browse and visualize Git history graphs in a comprehensible way, following different branching models."
pkgver="0.1.18"
pkgrel=1
url="https://github.com/mlange-42/git-igitt"
license=('MIT')
source=(
    "https://github.com/mlange-42/git-igitt/releases/download/${pkgver}/git-igitt-${pkgver}-linux-amd64.tar.gz"
    "https://raw.githubusercontent.com/mlange-42/git-igitt/${pkgver}/LICENSE"
    )
sha256sums=('cabc31029ceae9fc10b8579a6d3b51fa3355d3cbb0f0ce80ab3d46e709a51481'
            'ac572723009f6bfd4ae3fc2df3bc7bf86a705793ce5dee704502ef80619faff4')
arch=("x86_64")
depends=(zlib glibc gcc-libs)
conflicts=(git-igitt)
provides=(git-igitt)

package() {
  mkdir -p ${pkgdir}/usr/bin
  install -m 755 git-igitt ${pkgdir}/usr/bin/
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
