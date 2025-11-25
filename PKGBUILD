# Bakımcı (Maintainer): Hİdayet Erdem
pkgname=treex
pkgver=1.0.0
pkgrel=1
pkgdesc="Directory lister with optional features (size, lines, summary, color support) written in Python, similar to the tree command."
arch=('any')
url="https://github.com/herdem09/treex" # Lütfen GitHub/proje linkinizle değiştirin
license=('MIT') # Veya kullandığınız lisans (örneğin GPL)

# Bağımlılıklar
depends=('python')

# Kaynak dosyalar ve sağlama toplamları
# Betiğinizin adını "main.py" olarak aldım.
source=("main.py") 
sha256sums=('f28f0b5f7a5f151192cbafb66a3191da8362e169aa367d421ace839172741406')

# Betiğin herhangi bir derleme ihtiyacı yok
build() {
  : 
}

# Kurulum adımları
package() {
  # 1. Betiği çalıştırılabilir olarak /usr/bin altına kopyala
  # Not: Komutun adı 'treex' olacak, dosya adı 'main.py'.
  install -D -m 755 "${srcdir}/main.py" "${pkgdir}/usr/bin/${pkgname}"

  # 2. Opsiyonel: Lisans dosyasını kopyala (Eğer bir LICENCE dosyası oluşturduysanız)
  # install -D -m 644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"

  # 3. Opsiyonel: Konfigürasyon dosyası için dizin oluştur (betik .config/treex/treex.conf arıyor)
  install -d "${pkgdir}/etc/treex"
  # Eğer bir örnek konfigürasyon dosyası ekleyecekseniz:
  # install -D -m 644 treex.conf.example "${pkgdir}/etc/treex/treex.conf.example"
}
