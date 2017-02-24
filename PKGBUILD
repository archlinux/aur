# Maintainer: Márcio Sousa Rocha <marciosr10@gmail.com>
# Baseado no PKGBUILD feito por Lara Maia <lara@craft.net.br>
DLAGENTS=('https::/usr/bin/curl -k -o %o %u')
 
pkgname=irpf
pkgver=2017.1.0
pkgrel=1
license=('custom')
 
arch=(any)
pkgdesc='Programa Oficial da Receita para elaboração do IRPF'
url='http://www.receita.fazenda.gov.br'
 

source=(https://downloadirpf.receita.fazenda.gov.br/irpf/2017/irpf/arquivos/IRPF2017-1.0.zip
        Copyright
        $pkgname.png
        $pkgname.desktop
        $pkgname.install
		$pkgname)
 

md5sums=('ff83ccab6dcbeeba006872e42ef612ff'
         '56a8372f7b4e1e1e51a6fff6255365d4'
         '43d8c9617118578f03b2c4eeb1c72c57'
         '5c3f364ed6e30e8aac69ad4394deabba'
         '268c8018f98be22e77d8ca711140292a'
         '1393bb1d170a8aeaccfe0c2ee2c818cf')
 
depends=('java-environment' 'hicolor-icon-theme' 'desktop-file-utils')
optdepends=('receitanet: Para envio do IRPF')
install=$pkgname.install
 
 
package() {
        cd "$srcdir"/IRPF2017
        rm -f IRPF2017.exe
		rm -f exec.sh
        mkdir -p "$pkgdir"/usr/share/{icons/hicolor/128x128/apps,applications,licenses/irpf,irpf}
		mkdir "$pkgdir"/usr/bin
       
        cp -rf tutorial "$pkgdir"/usr/share/irpf/
        cp -rf lib "$pkgdir"/usr/share/irpf/
		cp -rf help "$pkgdir"/usr/share/irpf/
       
        install -Dm644 irpf.jar "$pkgdir"/usr/share/irpf/
        install -Dm644 IRPF2017.ini "$pkgdir"/usr/share/irpf/
        install -Dm644 IRPF2017.acb "$pkgdir"/usr/share/irpf/

        install -Dm644 Leia-me.htm "$pkgdir"/usr/share/irpf/
        install -Dm644 offline.png "$pkgdir"/usr/share/irpf/
        install -Dm644 online.png "$pkgdir"/usr/share/irpf/
        install -Dm644 pgd-updater.jar "$pkgdir"/usr/share/irpf/

        install -Dm755 "$srcdir"/irpf "$pkgdir"/usr/bin/
       
        install -Dm644 "$srcdir"/Copyright "$pkgdir"/usr/share/licenses/irpf/
       
        install -Dm644 "$srcdir"/irpf.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/
        install -Dm644 "$srcdir"/irpf.desktop "$pkgdir"/usr/share/applications/
}
