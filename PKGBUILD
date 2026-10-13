# Maintainer: a2sc <a_aur at a2sc eu>
#
# Arch Linux PKGBUILD for element-lk-jwt-service-bin
# https://github.com/element-hq/lk-jwt-service

_reponame="lk-jwt-service"
pkgname="element-${_reponame}-bin"
pkgver=0.9.0
pkgrel=1
pkgdesc='LiveKit Management Service for Element Call'
arch=(x86_64 aarch64)
url='https://github.com/vector-im/lk-jwt-service/'
license=("AGPL-3")
conflicts=('element-lk-jwt-service')
options=(!debug)

source=(
	"${_reponame}.service"
	"env.conf"
)
source_x86_64=(
	"$_reponame::https://github.com/element-hq/${_reponame}/releases/download/v${pkgver}/${_reponame}_linux_amd64"
)
source_aarch64=(
	"$_reponame::https://github.com/element-hq/${_reponame}/releases/download/v${pkgver}/${_reponame}_linux_arm64"
)
backup=('etc/lk-jwt-service/env.conf')
sha512sums=('48fdad2ad2eb41fbba132cf7a8f2abe9ade07cc0d4d9a80c9a8f9180d7810dd46c41b34d889b4194756cbea15bd8d1875aa611bac4ee0cf993dcbf9079f02290'
            '5d1a093b2764cbab722652f552c229c3269b360d6d0252242280582322d8bf5b78954b57d27009a7da7afa9268377545ff8560579de54296a35c40b226bbc517')
sha512sums_x86_64=('2c21a04c26d86722e2130cebe085ac7a131a44e05e439ac8d0bdafc83a70892bb12cbc61b57d464c0f0726e2d29fe1f83d1395fff79668ac6295c810ccfea12d')
sha512sums_aarch64=('5219e4bdb01ea872ea18c183bd5e0d8336af01761974247e9c33b6627fba7003fc4bb8718f4e75e64184b4cf2c8b566fc8177374f4ea8c0d71e7a0615bc974aa')


package() {
  install -vDm755 $srcdir/${_reponame} -t "$pkgdir/usr/bin"
  install -vDm644 ${_reponame}.service -t "$pkgdir/usr/lib/systemd/system/"
  install -vDm644 env.conf -t "$pkgdir/etc/lk-jwt-service/"
}

