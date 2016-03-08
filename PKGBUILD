# Maintainer: Márcio Sousa Rocha <marciosr10@gmail.com>

 
pkgname=leao
pkgver=2016.1.0
pkgrel=2
license=('custom')
 
arch=(any)
pkgdesc='O Carnê-leão é o programa para a tributação do Imposto sobre a Renda das Pessoas Físicas, sob a forma do recolhimento mensal obrigatório, pelo contribuinte, pessoa física, residente no Brasil, que receber rendimentos de outra pessoa física ou do exterior.'
url='http://www.receita.fazenda.gov.br'
 

source=(http://www.receita.fazenda.gov.br/Publico/programas/irpf/2016/CarneLeao/Java/LEAO2016v1.0.zip
        $pkgname.png
        $pkgname.desktop
        $pkgname.install
		$pkgname)
 

md5sums=('4a1f49ba72a511a1fedb0e9856ae91db'
         '725dc07b10c6debced300e9aa106e8fa'
         'f676220f7e42fd6ae2cd7172cd5807f9'
         'b0a5c911f4a3ce472699aa8b81d21b3d'
		 'c5f9c5c6d9acd1d0db7effb401f4e685')
 
depends=('jre8-openjdk' 'hicolor-icon-theme' 'desktop-file-utils')
optdepends=('receitanet: Para envio do IRPF')
install=$pkgname.install
 
 
package() {
        cd "$srcdir"/LEAO2016
        rm -f LEAO2016.exe
		rm -f exec.sh
		rm -f Leia_me.htm
		rm -f exec.bat
		rm -f RFB.ico
		
        mkdir -p "$pkgdir"/usr/share/{icons/hicolor/128x128/apps,applications,leao}
		mkdir "$pkgdir"/usr/bin
       
        cp -rf lib "$pkgdir"/usr/share/leao/
		cp -rf help "$pkgdir"/usr/share/leao/
		
       
        install -Dm644 PgdCarneLeao.jar "$pkgdir"/usr/share/leao/
        install -Dm755 "$srcdir"/leao "$pkgdir"/usr/bin/
        install -Dm644 offline.png "$pkgdir"/usr/share/leao/
        install -Dm644 online.png "$pkgdir"/usr/share/leao/
       
       
        install -Dm644 "$srcdir"/leao.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/
        install -Dm644 "$srcdir"/leao.desktop "$pkgdir"/usr/share/applications/
}
