# Maintainer: Felipe Facundes
pkgname=openvino-models
pkgver=3.7.1_R4.2
pkgrel=2
pkgdesc="OpenVINO™ Toolkit Model Repository"
arch=('any')
url="https://docs.openvino.ai/"
license=('Apache')
depends=('openvino')
file="openvino-models.tar"
source=("https://github.com/felipefacundes/openvino_models_bkp/releases/download/%233.7.1/openvino-models.tar")
sha256sums=('6b96a0a4562a1e7be6939f05c6212e3ca3c0996accda08651220c1ebca58d1ce')

package() {
    # Criar diretório de destino
    install -d "$pkgdir/usr/lib/"
    
    # Copiar todo o conteúdo dos modelos
    cp -r "$srcdir/"* "$pkgdir/usr/lib/"
	rm -f "$pkgdir/usr/lib/$file"
    
    # Definir permissões apropriadas
    find "$pkgdir/usr/lib/openvino-models" -type f -exec chmod 644 {} \;
    find "$pkgdir/usr/lib/openvino-models" -type d -exec chmod 755 {} \;
}