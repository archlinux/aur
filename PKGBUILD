#! /bin/bash
# Contributor: WAntilles <wantilles@adslgr.com>
# Maintainer: jorge_barroso <jorge.barroso.11@gmail.com>

pkgname=addon-compatibility-reporter
pkgver=2.0.4
_acrfilename=add_on_compatibility_reporter-$pkgver-fx.xpi
acrID="compatibility@addons.mozilla.org"
pkgrel=1
pkgdesc="Add-on Compatibility Reporter addon for Firefox Developer Previews & Betas"
arch=('any')
_sourcetarballdir=https://addons.mozilla.org/firefox/downloads/file/145009
license=('MPL' 'GPL')
url="https://addons.mozilla.org/addon/15003/"
depends=('firefox>=16.0')
groups=('firefox-essential-addons' 'firefox-best-addons')
source=($_sourcetarballdir/$_acrfilename)
sha512sums=('bc07747cd2c0db56044bde86076cd26bb21a51dcb572792af6ac6607bc3b0aa00b7d1cf18c405ea1c2140fd9953c85b7eeea40417b27ce4f031bd87dc92d51de')

package() {
    cd ${srcdir}
    install -m755 -d ${pkgdir}/usr/lib/firefox/extensions/$acrID
    cp -a * ${pkgdir}/usr/lib/firefox/extensions/$acrID
    rm -f ${pkgdir}/usr/lib/firefox/extensions/$acrID/$_acrfilename
    cd ${pkgdir}/usr/lib/firefox/extensions/$acrID

    # Fix permissions
    find -type d -exec chmod 0755 \{\} \+
    find -type f -exec chmod 0644 \{\} \+
}


