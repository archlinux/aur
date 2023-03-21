# Maintainer: somercet <somercet google mail>
pkgname=otf-coelacanth
pkgver=458
pkgrel=1
pkgdesc="Ben Whitmore's old-style serif font family, after Bruce Rogers' Jensonesque Centaur"
arch=('any')
url="https://github.com/Fuzzypeg/Coelacanth"
license=('OFL')
source=('https://github.com/Fuzzypeg/Coelacanth/archive/refs/tags/0.9.0.tar.gz'
        'SIL-OFL.txt'
        '61-coelacanth.conf')
sha256sums=('bc34322d794c10e9c51f417473161955a67f4a8319690d5eb5f8b2aaae5ee9c4'
            'ac9e9ea494b7ac2ee09c9a93a5743b6f65f5fa5cf234e24858a4e2d5cc373ac0'
            '07acde55fbe7339e839d9f325b9472bf92918021b5b5e17db1625924232d286a')

package() {
    install -Dm644 -t "${pkgdir}/usr/share/fonts/coelacanth/" Coelacanth-0.9.0/interpolatedFonts/Coelacanth*.otf
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" SIL-OFL.txt
    install -Dm644 -t "${pkgdir}/etc/fonts/conf.avail" 61-coelacanth.conf
    install -d "${pkgdir}/etc/fonts/conf.d"
    ln -s "../conf.avail/61-coelacanth.conf" "${pkgdir}/etc/fonts/conf.d/61-coelacanth.conf"
}
