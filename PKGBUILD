# Maintainer: Anonim Muhtar <anon@muhtar.lan>
pkgname=muhtar-dil
pkgver=1.6
pkgrel=1
pkgdesc="Türkçe sözdizimine sahip samimi bir programlama dili motoru."
arch=('any')
url="https://github.com/muhtar-projesi/muhtar"
license=('GPL')
depends=('python')
source=('muhtar_motoru.py')
sha256sums=('8d898e5b712a16168b29cbbcf0b552edfab96596d0a57c91b551351f13880f7e')

package() {
    # Motoru her sistemde kendi adıyla (muhtar_motoru.py) kurar
    install -Dm755 "${srcdir}/muhtar_motoru.py" "${pkgdir}/usr/local/bin/muhtar_motoru.py"
    
    # Kanka kolaylık olsun diye bir de sembolik link atalım, 
    # böylece hem 'muhtar_motoru.py' hem de 'muhtar1' yazınca çalışır.
    ln -s /usr/local/bin/muhtar_motoru.py "${pkgdir}/usr/local/bin/muhtar1"
}
