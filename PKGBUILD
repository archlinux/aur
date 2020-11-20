# Maintainer: Christopher Fair  <christopherpfair at comcast dot net>
pkgname=git-subrepo
pkgver=0.4.2
pkgrel=1
pkgdesc="Git Submodule Alternative"
arch=('i686' 'x86_64')
url="https://github.com/ingydotnet/git-subrepo.git"
license=('MIT')
depends=('git')
makedepends=('git')
source=("https://github.com/ingydotnet/git-subrepo/archive/${pkgver}.tar.gz")
sha256sums=('64c473a8070b7cf7b0fbb9d9bff40381ebc6a57eaaa1bc17e66f2a5920dd1ef8')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # git-subrepo
  mkdir "${pkgdir}/opt"
  cp -R . "${pkgdir}/opt/git-subrepo" 
  install -D -m644 License "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p "${pkgdir}/etc/profile.d"
  echo "source /opt/git-subrepo/.rc" > "${pkgdir}/etc/profile.d/git-subrepo.sh" 

}

