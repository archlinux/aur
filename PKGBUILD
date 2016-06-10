# Maintainer: oozyslug <oozyslug at gmail dot com>
# Contributor: oozyslug <oozyslug at gmail dot com>
# Submitter: oozyslug <oozyslug at gmail dot com>

pkgname=hugo
pkgver=0.16
pkgrel=1
pkgdesc="Fast and Flexible Static Site Generator in Go"
arch=('x86_64' 'i686' 'arm')
url="http://hugo.spf13.com/"
license=('Apache')
if [ "$CARCH" = "i686" ]; then
  _PKGARCH=386
elif [ "$CARCH" = "arm" ]; then
  _PKGARCH=arm
else
  _PKGARCH=amd64
fi
source_x86_64=("https://github.com/spf13/hugo/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux-64bit.tgz")
source_i686=("https://github.com/spf13/hugo/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux-32bit.tgz")
source_arm=("https://github.com/spf13/hugo/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_arm32.tgz")
sha256sums_x86_64=('13e299dc45bea4fad5bdf8c2640305a5926e2acd02c3aa03b7864403e513920e')
sha256sums_i686=('aed82d156f01a4562c39bd1af41aa81699009140da965e0369c370ba874725c9')
sha256sums_arm=('bc836def127d93e2457da9994f9c09b0100523e46d61074cd724ef092b11714f')

package() {
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

