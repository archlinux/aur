# Maintainer: Christopher Fair  <christopherpfair at comcast dot net>
pkgname=git-subrepo
pkgver=0.4.1
pkgrel=4
pkgdesc="Git Submodule Alternative"
arch=('i686' 'x86_64')
url="https://github.com/ingydotnet/git-subrepo.git"
license=('MIT')
depends=('git')
makedepends=('git')
source=("https://github.com/ingydotnet/git-subrepo/archive/${pkgver}.tar.gz")
sha256sums=('64cc2490c54fe1e5396bb14f6bbf0aa8378085f3b8847fd8ed171e5ddd886065')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # git-subrepo
  mkdir "${pkgdir}/opt"
  cp -R . "${pkgdir}/opt/git-subrepo" 
  install -D -m644 License "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p "${pkgdir}/etc/profile.d"
  echo "source /opt/git-subrepo/.rc" > "${pkgdir}/etc/profile.d/git-subrepo.sh" 

}

