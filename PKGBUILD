# Maintainer: Christopher Fair  <christopherpfair at comcast dot net>
pkgname=git-subrepo
pkgver=0.4.5
pkgrel=1
pkgdesc="Git Submodule Alternative"
arch=('i686' 'x86_64')
url="https://github.com/ingydotnet/git-subrepo.git"
license=('MIT')
depends=('git')
makedepends=('git')
source=("https://github.com/ingydotnet/git-subrepo/archive/${pkgver}.tar.gz")
sha256sums=('bb2f139222cfecb85fe9983cd8f9d572942f60097d6d736e2e6b01d1292e0a8a')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # git-subrepo
  mkdir "${pkgdir}/opt"
  cp -R . "${pkgdir}/opt/git-subrepo" 
  install -D -m644 License "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p "${pkgdir}/etc/profile.d"
  echo "source /opt/git-subrepo/.rc" > "${pkgdir}/etc/profile.d/git-subrepo.sh" 

}

