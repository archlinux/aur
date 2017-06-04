# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=bash-resume
pkgver=1.0.0
pkgrel=1
pkgdesc="Adds support in shell scripts to resume execution at last failing point. Like "make" for shell scripts"
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/bash-resume"
depends=('bash')
source=("https://github.com/kata198/bash-resume/archive/${pkgver}.tar.gz")
sha512sums=('e3acea7d4e60e905a42a91e0c134fff60de190a356a658322d5ce5fef46ff2a6f91ea28c60433f6a30cc9d45f0652181e29fcddf81901b9dd34a32797f4f643d')

build() {
  cd "$srcdir"/bash-resume-$pkgver
}

package() {
  cd bash-resume-$pkgver

  mkdir -p "${pkgdir}"

  export DESTDIR="$pkgdir"
  ./install.sh

  mkdir -p "${pkgdir}/usr/share/bash-resume/examples"

  pushd "${pkgdir}/usr/share/bash-resume"
  ln -s /etc/bash-resume.sh
  popd

  cp -f example*.sh "${pkgdir}/usr/share/bash-resume/examples/"

}
