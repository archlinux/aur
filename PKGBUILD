# Maintainer: AT10GHz <sebastian_franz@mba42.de>
pkgname=dayton-kabx
pkgver=1.0.2
pkgrel=2
pkgdesc="Software für Dayton Audio KAB Bluetooth Verstärker (Wine). Inkl. USB-Auto-Config."
arch=('any')
url="https://www.daytonaudio.com"
license=('custom')
depends=('wine' 'unzip')
source=("kabx.zip::https://www.daytonaudio.com/images/resources/dayton-audio-kabx-dsp-control-1.0.2.zip"
        "dayton-kabx.desktop"
        "kabx.sh"
        "99-dayton-kabx.rules")
sha256sums=('fb6d86fd4d501f56299d61188373a687f5e81fb32b63697a700f410c2d1f4e24'
            '8af5565ce0c2a667f46a980727f73362df3fda5ca1b0ad57a78b556b989a3cc5'
            'e10c11c06a65c8a056fe88133f7f2651d69d37384af699ef2cd50c791d13aed0'
            '5cdf92855e180f0ca431965368f05816f35e363863e9516bd5834c7dd267dcee')

package() {
    install -d "$pkgdir/opt/dayton-kabx"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"
    # Hier wird die USB-Regel im System hinterlegt:
    install -d "$pkgdir/usr/lib/udev/rules.d"

    install -m 755 "$srcdir/KPX DSP Control-1.0.2.exe" "$pkgdir/opt/dayton-kabx/installer.exe"
    install -m 755 "$srcdir/kabx.sh" "$pkgdir/usr/bin/dayton-kabx"
    install -m 644 "$srcdir/dayton-kabx.desktop" "$pkgdir/usr/share/applications/"
    install -m 644 "$srcdir/99-dayton-kabx.rules" "$pkgdir/usr/lib/udev/rules.d/"
}
