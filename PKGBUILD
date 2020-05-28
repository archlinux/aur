# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: bohoomil <@zoho.com>

pkgname=ttf-source-serif-pro-ibx
pkgver=3.001
pkgrel=1
depends=('fontconfig')
pkgdesc="A serif typeface in the transitional style, designed to complement Source Sans"
url="http://www.adobe.com/"
arch=('any')
license=('custom:OFL')
conflicts=('adobe-source-serif-pro-fonts' 'otf-source-serif-pro-ibx')
groups=('infinality-bundle-fonts-extra')
source=("https://github.com/adobe-fonts/source-serif-pro/archive/${pkgver}R.tar.gz"
        45-source-serif-pro.conf
        90-tt-source-serif-pro.conf)
sha1sums=('63d1f4c5bb0f8982a4c6fe945c356e1322493274'
          'ec79743b49b83d380ca86918c7c44d474fd5101d'
          '19dfa23495d142c728f8947b5eefd169f495e82e')

package(){
  cd "source-serif-pro-${pkgver}R"

  install -m755 -d "$pkgdir"/usr/share/licenses/"$pkgname"
  install -m644 LICENSE.md "$pkgdir"/usr/share/licenses/"$pkgname"

  install -m755 -d "$pkgdir"/usr/share/fonts/"$pkgname"
  install -m644 TTF/*.ttf "$pkgdir"/usr/share/fonts/"$pkgname"

  cd "$srcdir"
  install -m755 -d "$pkgdir"/etc/fonts/conf.avail
  install -m755 -d "$pkgdir"/etc/fonts/conf.d
  install -m644 45-source-serif-pro.conf \
    "$pkgdir"/etc/fonts/conf.avail/45-source-serif-pro.conf
  install -m644 90-tt-source-serif-pro.conf \
    "$pkgdir"/etc/fonts/conf.avail/90-tt-source-serif-pro.conf

  cd "$pkgdir"/etc/fonts/conf.d
  ln -s ../conf.avail/45-source-serif-pro.conf .
  ln -s ../conf.avail/90-tt-source-serif-pro.conf .
}
