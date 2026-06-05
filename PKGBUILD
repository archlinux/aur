# Maintainer: lori28167 <lorenzocozzaglio.10@gmail.com>
pkgname=cider-2
pkgver=3.1.8
pkgrel=1
pkgdesc="A new look into listening and enjoying Apple Music (Pre-compiled)(PAID)"
arch=('x86_64')
url="https://cider.sh" # Inserisci l'URL ufficiale
license=('AGPL3')
depends=('alsa-lib' 'gtk3' 'nss') # Inserisci le dipendenze reali del programma
provides=('cider')
conflicts=('cider')

# Qui devi inserire il link diretto al file ospitato su internet
source=("https://github.com/lori28167/lori28167/releases/download/1/cider-v3.1.8-linux-x64.pkg.tar.zst")
sha256sums=('bbc031d8da8ac47866ce69b8786522e97a5f3d71f2e859ddba3b6996751fcdee')

package() {
    # Copiamo direttamente la cartella 'opt' estratta nella cartella del pacchetto
    if [ -d "${srcdir}/opt" ]; then
        install -d "${pkgdir}/opt"
        cp -a "${srcdir}/opt/"* "${pkgdir}/opt/"
    fi

    # Facciamo lo stesso per la cartella 'usr' (che solitamente contiene l'eseguibile, 
    # l'icona e il file .desktop per il menu delle app)
    if [ -d "${srcdir}/usr" ]; then
        install -d "${pkgdir}/usr"
        cp -a "${srcdir}/usr/"* "${pkgdir}/usr/"
    fi
}