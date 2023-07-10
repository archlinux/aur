# Maintainer: Yichao Zhou <broken.zhou@gmail.com>
# Maintainer: gothicVI <sebastian [dot] steinbeisser [at] googlemail [dot] com>
pkgname=texlive-installer
pkgver=2023
pkgrel=6
pkgdesc="This packages provides the installer of texlive. It also tricks Arch into thinking it has its texlive packages installed."
url="http://www.tug.org/texlive/"
arch=('any')
license=('GPL')
depends=('wget' 'xz')
optdepends=(tk)
makedepends=()
replaces=()
provides=('texlive-core' 'texlive-bin' 'texlive-htmlxml' "texlive-formatsextra=${pkgver}" $(pacman -Sgq texlive texlive-lang))
source=("http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz")
md5sums=('SKIP')
install="${pkgname}".install

package() {
  rm -r "${srcdir}"/install-tl-[0-9]*/tlpkg/installer/wget
  rm -r "${srcdir}"/install-tl-[0-9]*/tlpkg/installer/xz

  install -d "${pkgdir}"/opt
  cp -R "${srcdir}"/install-tl-[0-9]*/ "${pkgdir}"/opt/texlive-installer
}
