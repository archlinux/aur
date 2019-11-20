# Maintainer: thorko contact@thorko.de
pkgname=sensu-cli
pkgver=5.15.0
pkgrel=1
pkgdesc="Sensu Go cli"
arch=('x86_64' 'armv7h')
url='https://sensu.io'
license=('MIT')
#makedepends=('')
source=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz"
        "${pkgname}-${pkgver}_x86_64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz"
      )
sha256sums=(
            'fed3bf8e849a87dbab032b5db49b39ef4eff8dfa5c5f297219facdc6581dab49'
            'ffa2b007cae8dcbdc338fcd6bc297aa820d3b527d9eb8c198c4e76a4cab183d9'
          )


build() {
        tar xzvf ${pkgname}-${pkgver}_$CARCH.tar.gz
}

# TODO: better build from source
# build() {}
package() {
    install -Dm755 "${srcdir}/sensuctl" "${pkgdir}/usr/bin/sensuctl"
}

