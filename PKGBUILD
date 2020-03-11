# Maintainer: bohoomil <@zoho.com>
# Maintainer Solomon Choina <shlomochoina@gmail.com>
pkgname=ttf-hack-ibx
pkgver=3.003
pkgrel=1
depends=('fontconfig')
pkgdesc="A typeface designed for source code."
url="http://sourcefoundry.org/hack/"
arch=('any')
groups=('infinality-bundle-fonts')
license=('custom:OFL,custom:Other')
source=("https://github.com/source-foundry/Hack/releases/download/v${pkgver}/Hack-v${pkgver}-ttf.zip"
        45-hack.conf
        90-tt-hack.conf)
sha512sums=('7f6a2353711c9da17ff6ce648a28ff038462fbb6f3be91eb5b7f797a7182bb21224942ea5964cc8add3912e18c7e6267d311c7674f45f4295edfe1a1f69f46d3'
            'a7ba7a0a396a5bf39c38ea815740c8648db576d403e13f23bf10e3da76bcd82db5f8e63806008f7dc387d99f61e29dfaf5a41ca9f12c4e62ad9e8f389d64166e'
            '48e62483ca484ce1e57ac45f2c98de3a8d628913adc701665359015d610fefecf1e585ea3cac1a6c9bb6dd2f76b03d8a25989992005e4f6033f0c3139e1c3089')


package(){

  install -m755 -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 ttf/*.ttf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  install -D -m644 45-hack.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-hack.conf
  install -D -m644 90-tt-hack.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-hack.conf

  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-hack.conf .
  ln -s ../conf.avail/90-tt-hack.conf .
}
