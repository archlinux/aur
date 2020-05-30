# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-defrag-maps
pkgver=20091031
pkgrel=2
pkgdesc='Map packs for the DeFRaG Quake3 modification.'
url='https://q3df.org/'
license=('GPL')
arch=('any')
depends=('quake3-defrag')
makedepends=('unzip')
source=('http://www.german-defrag.de/files/defrag/defragpak1.zip' \
        'http://www.german-defrag.de/files/defrag/defragpak2.zip' \
        'http://www.german-defrag.de/files/defrag/defragpak3.zip' \
        'http://www.german-defrag.de/files/defrag/defragpak4.zip' \
        'http://www.german-defrag.de/files/defrag/defragpak5.zip' \
        'http://www.german-defrag.de/files/defrag/defragcpmpak01.zip' \
        'http://www.german-defrag.de/files/defrag/defragpak7.zip' \
        'http://www.german-defrag.de/files/defrag/defragpak8.zip' \
        'http://www.german-defrag.de/files/defrag/defragpak9.zip' \
        'http://www.german-defrag.de/files/defrag/defragpak10.zip' \
        'http://www.german-defrag.de/files/defrag/defragpak11.zip')
noextract=('defragpak1.zip' 'defragpak2.zip' 'defragpak3.zip' \
           'defragpak4.zip' 'defragpak5.zip' 'defragcpmpak01.zip' \
           'defragpak7.zip' 'defragpak8.zip' 'defragpak9.zip' \
           'defragpak10.zip' 'defragpak11.zip')
sha256sums=('0d013be5b338bb6070502fa4d5b20f3f4ac9b7c1b72ccf64a10dd143dece0b7e'
            'a1e2ceaa0717dd592a22060bbdd9ce415a15df9470a709bc04845ad21a064928'
            'ed7dd62cdabef98fd8e8ac3e2f477ac3483fb6d09aecb146cadd40c4ed156cb0'
            '5f00fbfb2d40f5ac0dae8849653b370d9abe7ca050142f247e113a66f3f0eddd'
            '74fb1d5c62e6a8553e26e6f89a0d1b77b48ebe4a7024d0f8518c6303029a04ef'
            '9de7a8d34d2a31db3c6593d1383c449b0b0cb09768062988736c9f75aad0028f'
            '30b18b716c03f562251e4f63b2194ab20289e7aa7f9ec53b23397d119f4c9dda'
            '94ebe9210133af7f7645011a0983e66df53604f9f1cc38431ad4786271892b61'
            'b6863f6f45fe144881cd929c063d8be747c0d637747c00d740f70ef4304d6f92'
            'ecccce33c03053b810c2883f51017329d528fdca641e76138aecb80e0666236d'
            '49466215b5b2dbfaf24e7e50ec4d9164b6e9fc8e040be177318d47274223f437')
PKGEXT=.pkg.tar

package() {
    cd "${srcdir}"

    # Create Destination Directories
    install -d "${pkgdir}/opt/quake3/defrag/"

    # Install Map Packs
    for i in $(ls defrag{pak,cpmpak}*.zip); do
        /usr/bin/unzip -j "${i}" -d "${pkgdir}/opt/quake3/defrag/"
    done

    # Fix permissions on extracted files
    find "${pkgdir}/opt/quake3/defrag/" -type f ! -perm 0644 -exec chmod 0644 {} \;
}
