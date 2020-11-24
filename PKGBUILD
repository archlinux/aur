# Maintainer: Christopher Fair  <christopherpfair at comcast dot net>
pkgname=git-subrepo
pkgver=0.4.3
pkgrel=1
pkgdesc="Git Submodule Alternative"
arch=('i686' 'x86_64')
url="https://github.com/ingydotnet/git-subrepo.git"
license=('MIT')
depends=('git')
makedepends=('git')
source=("https://github.com/ingydotnet/git-subrepo/archive/${pkgver}.tar.gz")
sha256sums=('d2e3cc58f8ac3d90f6f351ae2f9cc999b133b8581ab7a0f7db4933dec8e62c2a')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # git-subrepo
  mkdir "${pkgdir}/opt"
  cp -R . "${pkgdir}/opt/git-subrepo" 
  install -D -m644 License "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p "${pkgdir}/etc/profile.d"
  echo "source /opt/git-subrepo/.rc" > "${pkgdir}/etc/profile.d/git-subrepo.sh" 

}

