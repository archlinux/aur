# Maintainer: zer0def <zer0def@github>
pkgname=firecracker-bin
pkgver=0.21.1
pkgrel=1
pkgdesc="Secure and fast microVMs for serverless computing"
url="https://github.com/firecracker-microvm/firecracker"
arch=('x86_64' 'aarch64')
license=('Apache:2.0')
provides=('firecracker')
source=(
    "https://github.com/firecracker-microvm/firecracker/releases/download/v${pkgver}/firecracker-v${pkgver}-${CARCH}"
    "https://github.com/firecracker-microvm/firecracker/releases/download/v${pkgver}/jailer-v${pkgver}-${CARCH}"
)

case "${CARCH}" in
  x86_64)  sha512sums=(
    0cc622576261a61a9a30bd5891f9e865dbc82e2be1c7e6676f3ee42de9c73b897ed4dcdb9fc2684a1e19f1a752d9a71a4e8803a5dbf719943bb7b50ee4669877
    de7504cd5007b3d7acf0f9436fc5241ef4d0223eab6db92594a2d520763c08ee8543793b4b183b015370fa4dc7308e3beb6948e665a95bcc9ef5a1ff618ac026
  );;
  aarch64) sha512sums=(
    1a913a8c6be3f246b12f3f640e934cbf73ed1603f018f7d2f63fcc0e10ae33527f17ec3c72da73758d71353354a27f7fb2f0439c1bbde16fef1f53a6eb57a0f2
    edc62e6968921a025dd155988ce4a8a4abc5c9f1ebbc7feb543ef3a3e7dae4e0bcdc9f9ef702dc6ee0818ba55b06c545f0f750bc59a876b4118f2316d3c2d270
  );;
esac

package() {
  install -Dm755 "${srcdir}/firecracker-v${pkgver}-${CARCH}" ${pkgdir}/usr/bin/firecracker
  install -Dm755 "${srcdir}/jailer-v${pkgver}-${CARCH}" ${pkgdir}/usr/bin/jailer
}
