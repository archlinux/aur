# Maintainer: Yao YongPeng <iyao.yongpeng@gmail.com>

pkgname=finalspeed-client-cli
pkgver=1.0
pkgrel=1
pkgdesc="A bilateral acceleration software NoUI client"
url="https://github.com/sundapeng/FinalSpeed"
arch=("any")
license=("GPL2")
depends=("java-environment" "libpcap")
install="${pkgname}.install"
source=("https://github.com/sundapeng/FinalSpeed/releases/download/1.0/finalspeed-1.0.zip"
        "${pkgname}.install"
        "${pkgname}.service"
        "${pkgname}.sh"
        "client_config.json"
        "port_map.json")
sha256sums=("b7fdee14234ba6b53bd56fe1034fa8a4dbbd7cc9ab0a36377646b71a4f41a3a6"
            "9dc98545eb6925ea95c6035adfc76daffbb3ce24b54cebe7c4478ca50f75b42d"
            "95d509a1afcdbb4f318b791667f443b5d880346a22639bffa85181db719d069f"
            "921d1825aab8832670ed83ddb3e6983399356562d035b2929664d4513f58a8e1"
            "3a828072b7125ff59c6f5f70c84fafc34e63711e39abe0c36320e1ccb348d6d5"
            "f53bdaa3e0918c1efbcde6096b633e781ccaf01f942bd425349d8baaaf75ab70")

package() {
    cd "${srcdir}"
    
    mv ${srcdir}/finalspeed-${pkgver}/finalspeed-${pkgver}.jar ${pkgname}.jar
    install -Dm755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
    install -Dm644 ${pkgname}.jar ${pkgdir}/opt/${pkgname}/${pkgname}.jar
    install -Dm644 client_config.json ${pkgdir}/opt/${pkgname}/client_config.json
    install -Dm644 port_map.json ${pkgdir}/opt/${pkgname}/port_map.json
    install -Dm644 ${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
}