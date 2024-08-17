_basepgkname=cosmopolitan
pkgname="${_basepgkname}-bin"
pkgver=3.7.1
pkgrel=1
pkgdesc="Build-once run-anywhere c library."
arch=('x86_64')
url="https://github.com/jart/cosmopolitan"
license=('ISC')
source=(    
            "${pkgname}::https://github.com/jart/cosmopolitan/releases/download/${pkgver}/cosmocc-${pkgver}.zip"
            "ape.conf"
            "ape-jart.conf"
        )

sha256sums=(
            '13b65b0e659b493bd82f3d0a319d0265d66f849839e484aa2a54191024711e85'
            '0a5d918ef46aaf764293fb18794eac021cb93637fe6abed7c9d3f06b7b2f4cad'
            '9351247b53d34dc584170c435512954b8eb1a69c7b3ff0bee43ce21264b8d467'
          )
provides=(  'ape'
            'cosmoreadelf'
            'cosmoar'
            'cosmocpp'
            'cosmoc++filt'
            'cosmoaddr2line'
            'cosmoelfedit'
            'cosmog++'
            'cosmocc'
            'cosmostrip'
            'cosmonm'
            'cosmosize'
            'cosmoc++'
            'cosmoobjcopy'
            'cosmoas'
            'cosmold'
            'cosmoobjdump'
            'cosmoranlib'
            'cosmogcc'
        )
conflicts=('cosmopolitan-git' 'wine' 'wine-staging')
options=(!strip)



package() {

  # Install binfmt files 
  install -Dm544 "ape.conf" "${pkgdir}/etc/binfmt.d/ape.conf"
  install -Dm544 "ape-jart.conf" "${pkgdir}/etc/binfmt.d/ape-jart.conf"

  cd "${srcdir}"
  # Install binaries
  install -Dm755 "bin/ape-x86_64.elf" "${pkgdir}/usr/bin/ape"
  install -Dm755 "bin/x86_64-linux-cosmo-readelf" "${pkgdir}/usr/bin/cosmoreadelf"
  install -Dm755 "bin/x86_64-linux-cosmo-ar" "${pkgdir}/usr/bin/cosmoar"
  install -Dm755 "bin/x86_64-linux-cosmo-cpp" "${pkgdir}/usr/bin/cosmocpp"
  install -Dm755 "bin/x86_64-linux-cosmo-c++filt" "${pkgdir}/usr/bin/cosmoc++filt"
  install -Dm755 "bin/x86_64-linux-cosmo-addr2line" "${pkgdir}/usr/bin/cosmoaddr2line"
  install -Dm755 "bin/x86_64-linux-cosmo-elfedit" "${pkgdir}/usr/bin/cosmoelfedit"
  install -Dm755 "bin/x86_64-linux-cosmo-g++" "${pkgdir}/usr/bin/cosmog++"
  install -Dm755 "bin/x86_64-linux-cosmo-cc" "${pkgdir}/usr/bin/cosmocc"
  install -Dm755 "bin/x86_64-linux-cosmo-strip" "${pkgdir}/usr/bin/cosmostrip"
  install -Dm755 "bin/x86_64-linux-cosmo-nm" "${pkgdir}/usr/bin/cosmonm"
  install -Dm755 "bin/x86_64-linux-cosmo-size" "${pkgdir}/usr/bin/cosmosize"
  install -Dm755 "bin/x86_64-linux-cosmo-c++" "${pkgdir}/usr/bin/cosmoc++"
  install -Dm755 "bin/x86_64-linux-cosmo-objcopy" "${pkgdir}/usr/bin/cosmoobjcopy"
  install -Dm755 "bin/x86_64-linux-cosmo-as" "${pkgdir}/usr/bin/cosmoas"
  install -Dm755 "bin/x86_64-linux-cosmo-ld" "${pkgdir}/usr/bin/cosmold"
  install -Dm755 "bin/x86_64-linux-cosmo-objdump" "${pkgdir}/usr/bin/cosmoobjdump"
  install -Dm755 "bin/x86_64-linux-cosmo-ranlib" "${pkgdir}/usr/bin/cosmoranlib"
  install -Dm755 "bin/x86_64-linux-cosmo-gcc" "${pkgdir}/usr/bin/cosmogcc"
}