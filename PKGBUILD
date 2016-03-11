# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=adapta-gtk-theme
pkgver='3.18.8+git20160309'
pkgrel=2
pkgdesc="An adaptive Gtk+ theme based on Material Design Guidelines."
arch=(any)
url="https://github.com/tista500/Adapta"
license=('GPL2')
depends=(gtk2 gtk3)
source=("https://github.com/tista500/Adapta/archive/${pkgver}-${pkgrel}.tar.gz")
sha256sums=(f4a64ba9dceb46d663fafaafcddab2bf2735ec2127ef9906262bea7da4502b56)

_theme_name=Adapta
_extracted_folder="${_theme_name}-$(sed s/+/-/g <<< "$pkgver")-${pkgrel}"

package() {
    target="${pkgdir}/usr/share/themes/${_theme_name}"
    install -dm755 "$target"
    cp -dpr --no-preserve=ownership "${_extracted_folder}/." -d "$target"
}
