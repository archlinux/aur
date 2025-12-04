# Contributor: Tim Savannah <kata198@gmail.com>

pkgname=bash-resume
pkgver=1.0.1
pkgrel=1
pkgdesc="Adds support in shell scripts to resume execution at last failing point. Like "make" for shell scripts"
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/bash-resume"
depends=('bash')
source=("https://github.com/kata198/bash-resume/archive/${pkgver}.tar.gz")
sha512sums=('9d5a9a73c688b0231a27da544bdd3f501c8c8a734302e9c751f2135619715129ba5e68634dec0979f6c681c1fea2301179ec98238b5a98f7691e85f0014e4afe')

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
