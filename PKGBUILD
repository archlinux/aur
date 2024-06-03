# Maintainer: gladykov <gladykov at gmail dot com>
# Contributor: gladykov <gladykov at gmail dot com>
pkgname='alram-alarm-for-ram'
_basename="alram"
pkgver=v0.1.1
pkgrel=1
pkgdesc="Alarm for RAM - monitor free RAM, alert when under threshold, kill tasks from list"
arch=('x86_64')
url="https://github.com/gladykov/${_basename}/"
options=('!debug')
license=('GPL-3.0')
depends=('glib2')
provides=('alram')

source=(
"${url}releases/download/${pkgver}/alram"
"${url}releases/download/${pkgver}/alram.service"
)

sha512sums=(
'2886a627e9cb23e3f1eb05b7f77bc7968f85395d7a9105fc88e43ad08c196ece2334f4cdc5331a704b2565e08888ab2c2d35b3d65cd5d5d12284785173abaf66'
'457343dfed48d29d2c06aff0c3b65db63b92012ec22f3392b078981c23b02d987776a18b46ab7c83653c167cb07d4da1ae2483573eca9574ce456dda3a08f5e2'
)

package() {
  cd "$srcdir/"
  mkdir -p "${pkgdir}/usr/bin"	
  install -D -m755 ${_basename} "${pkgdir}/usr/bin/"
  install -Dm644 ${_basename}.service "${pkgdir}/usr/lib/systemd/user/${_basename}.service"
}
