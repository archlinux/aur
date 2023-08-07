# Maintainer: jmcb <joelsgp@protonmail.com>
# Contributor: Dan Ginovker <danielginovker@gmail.com>

pkgname='2009scape'
pkgver='2.1.3'
pkgrel=2
pkgdesc='Authentic, Open Source 2009 Runescape Era Game (Launcher)'
url='https://2009scape.org'
arch=('x86_64')
license=('GPL')
depends=('java-runtime>=8')
source=('2009scape.jar::https://gitlab.com/2009scape/09launcher/uploads/1e13301bb9b7ef0080eb5928774151ee/09launcher.jar'
        '2009scape'
        '2009scape.desktop'
        '2009scape.png')
sha256sums=('f38e7303e6b3a74faef1e803cb1fe7277ff8d1a6c33a75f412deb16a93bb8f97'
            'c7713e811b46508228d288bb0f100e16471d9b0e145e9b307bf3934dadb73f4c'
            'f7e235d1c29345cec51cda35d910670afe4366d281bee7d5a38aba840ba06c66'
            'da472600b4cc81d8985e91518425a6c571d4b401af094ae7e3573de9c71fa8c1')
noextract=('2009scape.jar')

package() {
    cd "${srcdir}"

    # Copy launcher
    install -D -m644 \
        "2009scape.jar" \
        "${pkgdir}/usr/share/java/2009scape/2009scape.jar"

    # Desktop Environment integration
    install -D -m644 \
        "2009scape.desktop" \
        "${pkgdir}/usr/share/applications/2009scape.desktop"

    install -D -m644 \
        "2009scape.png" \
        "${pkgdir}/usr/share/pixmaps/2009scape.png"

    # Make "2009scape" a command that runs a bash file calling java -jar ..
    install -D -m755 \
        "2009scape" \
        "${pkgdir}/usr/bin/2009scape"
}

