# Maintainer: Rick Morgans <rick.morgans@gmail.com>
# derived from aur/balena-cli by
# Matthew McGinn <mamcgi@gmail.com>
# Gergely Imreh <imrehg@gmail.com>

pkgname=balena-cli-bin
_pkgname="${pkgname%-bin}"
provides=(${_pkgname})
pkgdesc='balena.io command line interface'
pkgver=12.51.1
pkgrel=1
arch=('x86_64')
url='https://balena.io/'
_github_url="https://github.com/balena-io/balena-cli"
license=('APACHE')
depends=()
makedepends=()
optdepends=(
  'docker: balena build/deploy'
  'python2: balena preload'
  'openssh: balena ssh'
  'linux-aufs: balena preload/build/deploy --build'
  'avahi: balena scan'
)
optdepends_x86_64=('lib32-glibc: emulated builds')
source=(
   https://github.com/balena-io/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x64-standalone.zip
)
options=(!strip)
replaces=('resin-cli')
sha256sums=('b3d9c32c5a8e3ced1be83e77db0e614f901d0099b1de2f3cb29c4688b41e2f70')

package() {
   mkdir ${pkgdir}/opt
   mv ${srcdir}/balena-cli ${pkgdir}/opt/
   mkdir -p ${pkgdir}/usr/bin
   ln -s /opt/balena-cli/balena ${pkgdir}/usr/bin/balena 
}
