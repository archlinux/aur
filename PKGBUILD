# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: bohoomil <@zoho.com>

pkgname=ttf-playfair-display-ibx
pkgver=1.200
pkgrel=1
depends=('fontconfig')
pkgdesc="An Open Source typeface family for display and titling use"
url="http://www.forthehearts.net/"
arch=('any')
groups=('infinality-bundle-fonts-extra')
license=('custom:OFL')
source=('https://github.com/google/fonts/blob/c0b8d90a7e6bd80588da02746085c903c8e2d242/ofl/playfairdisplaysc/PlayfairDisplaySC-Regular.ttf'
        'https://raw.githubusercontent.com/google/fonts/c0b8d90a7e6bd80588da02746085c903c8e2d242/ofl/playfairdisplaysc/OFL.txt'
        'https://github.com/google/fonts/raw/c0b8d90a7e6bd80588da02746085c903c8e2d242/ofl/playfairdisplaysc/PlayfairDisplaySC-Black.ttf'
        'https://github.com/google/fonts/raw/c0b8d90a7e6bd80588da02746085c903c8e2d242/ofl/playfairdisplaysc/PlayfairDisplaySC-BlackItalic.ttf'
        'https://github.com/google/fonts/raw/c0b8d90a7e6bd80588da02746085c903c8e2d242/ofl/playfairdisplaysc/PlayfairDisplaySC-Bold.ttf'
        'https://github.com/google/fonts/raw/c0b8d90a7e6bd80588da02746085c903c8e2d242/ofl/playfairdisplaysc/PlayfairDisplaySC-BoldItalic.ttf'
        'https://github.com/google/fonts/raw/c0b8d90a7e6bd80588da02746085c903c8e2d242/ofl/playfairdisplaysc/PlayfairDisplaySC-Italic.ttf'
        'https://github.com/google/fonts/raw/c0b8d90a7e6bd80588da02746085c903c8e2d242/ofl/playfairdisplay/PlayfairDisplay-Regular.ttf'
        'https://github.com/google/fonts/raw/c0b8d90a7e6bd80588da02746085c903c8e2d242/ofl/playfairdisplay/PlayfairDisplay-Black.ttf'
        'https://github.com/google/fonts/raw/c0b8d90a7e6bd80588da02746085c903c8e2d242/ofl/playfairdisplay/PlayfairDisplay-BlackItalic.ttf'
        'https://github.com/google/fonts/raw/c0b8d90a7e6bd80588da02746085c903c8e2d242/ofl/playfairdisplay/PlayfairDisplay-Bold.ttf'
        'https://github.com/google/fonts/raw/c0b8d90a7e6bd80588da02746085c903c8e2d242/ofl/playfairdisplay/PlayfairDisplay-BoldItalic.ttf'
        'https://github.com/google/fonts/raw/c0b8d90a7e6bd80588da02746085c903c8e2d242/ofl/playfairdisplay/PlayfairDisplay-Italic.ttf'
        45-playfair-display.conf
        90-tt-playfair-display.conf)
sha256sums=('ff7cf3685e80028ba29d3b5f07124f5f90adc93fe69086555a8bbd2a55ff04f6'
            'e414e07f7a4da16ed47ebec80d52dd79f21d3ca42bc92385a755d8078a038814'
            '9a508229401e2a5deb52ff9c11f00446a482bd25029836a54027716310cfe0b0'
            '6bea69bbdbbc93addd99bd124763e1fc8a31c9d72513e2d22087d04676e1546f'
            'b58a968cfc9b4e96e6857a206e1b042dc3fdbe5dc31cd75825d864f80ac7e915'
            '3fe8dda7cb14eced6cd56fe2eb7eae8bee5d70caa301e75a23f1ce19fa6b82cb'
            '9d9c78080ddb51db269056bd0d84e11007e6f6e1980ec15e757158afbb6f3ad4'
            '844b4c3b02e307318abb61d8ebd55bfb8e19304515075fd8af06af099480191e'
            '145f22e93511706943bb9f0af3496e70ec139e89c675a9c1543301634b11262f'
            'b9f4b47055adea18249253913994b06eba9c3c073c4ef3bf890732b5b433c13c'
            '37fcc00a7503976693088bed271e64ce34fca5119181da9acf5b74bd59da8c7e'
            'aa17c37411fc706e484f29591a86c5b15be51022cb7b33a3ce411274a7d9e9b5'
            'f658325ffab1a9f9ce0bdcd2cfc2f7d6ac144bf92a49580eb70913732825a3e2'
            '8a895998b40d15219c974515c36af38a92b7acb00cd0df27a3fd52891e28606d'
            '433544aba28f32a2ea249aa3ac098d22e1ed9dc880475c77e010ddd096c9b438')

package(){

  install -D -m644 OFL.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING

  install -m755 -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  install -D -m644 45-playfair-display.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-playfair-display.conf
  install -D -m644 90-tt-playfair-display.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-playfair-display.conf

  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-playfair-display.conf .
  ln -s ../conf.avail/90-tt-playfair-display.conf .
}
