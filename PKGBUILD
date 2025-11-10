# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=0.15
pkgname="zigdown"
pkgver=1.1.0
pkgrel=1
pkgdesc="Parse and render Markdown-like content to the terminal, to HTML, or inside Neovim"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/JacobCrabill/${pkgname}"
license=(
  'MIT'
)
depends=(
  'glibc'
)
makedepends=(
  "zig>=${_zig}"
)
_zigdepends=(
  # zigdown
  "zig-stb-image-db40631ef191d3692a706b142f524022c6be80d7.tar.gz::https://github.com/JacobCrabill/zig-stb-image/archive/db40631ef191d3692a706b142f524022c6be80d7.tar.gz"
  "zig-plutosvg-b2dcac090852c9b26f16798dbbb35c3da1f65773.tar.gz::https://github.com/JacobCrabill/zig-plutosvg/archive/b2dcac090852c9b26f16798dbbb35c3da1f65773.tar.gz"
  "zig-flags-8f65f0d5bf0d92b950ddf16afb34533491831c7d.tar.gz::https://github.com/JacobCrabill/zig-flags/archive/8f65f0d5bf0d92b950ddf16afb34533491831c7d.tar.gz"
  "treez-980316cb4fd0da6075a6a8f86bd1a3927bf68ad3.tar.gz::https://github.com/JacobCrabill/treez/archive/980316cb4fd0da6075a6a8f86bd1a3927bf68ad3.tar.gz"
  "known-folders-ab5cf5feb936fa3b72c95d3ad0c0c67791937ba1.tar.gz::https://github.com/ziglibs/known-folders/archive/ab5cf5feb936fa3b72c95d3ad0c0c67791937ba1.tar.gz"
  "ziglua-011758bab2c2b5a4b6e678e33a8dbb24570d4394.tar.gz::https://github.com/JacobCrabill/ziglua/archive/011758bab2c2b5a4b6e678e33a8dbb24570d4394.tar.gz"
  "tree-sitter-bash-49c31006d8307dcb12bc5770f35b6d5b9e2be68e.tar.gz::https://github.com/tree-sitter/tree-sitter-bash/archive/49c31006d8307dcb12bc5770f35b6d5b9e2be68e.tar.gz"
  "tree-sitter-c-e8841a6a9431b7365ac9055688429e1deb8db90f.tar.gz::https://github.com/tree-sitter/tree-sitter-c/archive/e8841a6a9431b7365ac9055688429e1deb8db90f.tar.gz"
  "tree-sitter-cmake-fe48221d4d9842d916d66b5e71ab3c6307ec28b3.tar.gz::https://github.com/uyha/tree-sitter-cmake/archive/fe48221d4d9842d916d66b5e71ab3c6307ec28b3.tar.gz"
  "tree-sitter-cpp-f41b4f66a42100be405f96bdc4ebc4a61095d3e8.tar.gz::https://github.com/tree-sitter/tree-sitter-cpp/archive/f41b4f66a42100be405f96bdc4ebc4a61095d3e8.tar.gz"
  "tree-sitter-json-4d770d31f732d50d3ec373865822fbe659e47c75.tar.gz::https://github.com/tree-sitter/tree-sitter-json/archive/4d770d31f732d50d3ec373865822fbe659e47c75.tar.gz"
  "tree-sitter-make-5e9e8f8ff3387b0edcaa90f46ddf3629f4cfeb1d.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-make/archive/5e9e8f8ff3387b0edcaa90f46ddf3629f4cfeb1d.tar.gz"
  "tree-sitter-python-de0c01e7102e755f6c2e1b3055ae6ca85f261a10.tar.gz::https://github.com/tree-sitter/tree-sitter-python/archive/de0c01e7102e755f6c2e1b3055ae6ca85f261a10.tar.gz"
  "tree-sitter-rust-c447dcce961ac438aaeaf117347749fe7d1e8365.tar.gz::https://github.com/tree-sitter/tree-sitter-rust/archive/c447dcce961ac438aaeaf117347749fe7d1e8365.tar.gz"
  "tree-sitter-yaml-1805917414a9a8ba2473717fd69447277a175fae.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-yaml/archive/1805917414a9a8ba2473717fd69447277a175fae.tar.gz"
  "tree-sitter-zig-b670c8df85a1568f498aa5c8cae42f51a90473c0.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-zig/archive/b670c8df85a1568f498aa5c8cae42f51a90473c0.tar.gz"

  # zig-plutosvg
  "plutovg-1.0.0.tar.gz::https://github.com/sammycage/plutovg/archive/refs/tags/v1.0.0.tar.gz"
  "plutosvg-9c3d6d701e3957a6bc61251f45852bfdf9cde3e9.tar.gz::https://github.com/sammycage/plutosvg/archive/9c3d6d701e3957a6bc61251f45852bfdf9cde3e9.tar.gz"
  # treez
  "tree-sitter-168ffad245131be4382c0f20938fd54a548feddd.tar.gz::https://github.com/JacobCrabill/tree-sitter/archive/168ffad245131be4382c0f20938fd54a548feddd.tar.gz"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "${_zigdepends[@]}"
)
noextract=(
  "${_zigdepends[@]%%::*}"
)
b2sums=('054eb9cb80f84c40202c9c7e70ec61bd854e96331dc20c8ba39f53de3b6c93cd08a7cf30271dc76b32bbae4b1556975c1d09fa6cfa5362f3e74c0f9203a8fec9'
        'e284162579422c325cc118a086c710da09966042157bdcc9205218386c17ea73dcc715177edd84ff8c817129d1114c584b967a8f834a115602ca2c771313f2c6'
        '20789d0ef34be86a9f6dcff82daa7f54d4aeabce275c259164f4df00606f3e2121b5efdad120fef686536343ebf3030d60238607a0ebea3948db45f60b601b73'
        'd144d903717301988b0bd20b98b35578e2354195972a1bbe30ac3d717b2a939e6c664dfc19fda769f2a96337d20d3e3a39bfa6a7cc57e4895b7547cc0594d1b2'
        '432f48b4146796c13102ac89850a2950b318638284ae78491fa4be9b7a9cc8952431efb771d8dca68a6e5d22801f1df6e6b109e6220dd9cc843fb5d863272b14'
        'e8e5d85be28341f6ba431a6a913803172c322711fd8ae9c5ba3937b6ed6ccc3ca1a4775b27ad91796a3359ec2af58fec28b9533cf74bfe01bffb6f912f89c36e'
        'd6903bba3152f1de6ae48fb8a58c6c27b46ca115c0e1e9955135bc905ebffc3338b627e4797d03360cfac74cd4c4e3b618751f108f9eab5f1c1a1b6848ed1891'
        '755e11add7d7612859e2db884a3be17efda00a46865e4ef0802f2f447bd37ade56bf674430a28b4b968ee553cb32c2094c00b2c5ef11477fddac47eebfa42f1d'
        '7374e40adf1aab40823016c8b12d7553f9f2f67949cd2a5fa6478469920bf99803b041de9f360a3a4167517fb85e0b767be7a4a67c876ddbbb2fda7635c9d94c'
        '644ac76af8c4f621f23841d51ac88da134735e05e9475c0f8aa1b867f97398f6bfd21cd687c2869034bea87e9bc573667c73f162a5ee786cd68d8dacf0e44ec8'
        'bc4c0c3702897fdf95cfb0f60726353c55aa2070620236fe5169ea8c0afb35895a54a81ee9e077795479c082cd97cada4321b15f1cd14f17035f06ad45be863a'
        '2a84f2aa1cd71c19d915af2a3597fa27a124541f945a5ed6565588a40343fa1eb3571fed3dc2bb949b9d207adb93c328eceeafcf29d8af38546054ff8e6f4b6c'
        'da196aaa09bd9dc4c5987e7a8be1a12d8c439058dbb9a03ada4be33281e6d8c301ebf289688aed0ddbb4105a46e6668792d388cb65d7e5d2b58a556ddfd35b4a'
        'ba4e8410a3f0479b37d8015e898694435e108867077f5bbf315e4f3d43e4655af7d99ac0514589983da31f14d0206ea5a227adb74c57c9441a8c059cdb480bc3'
        'd37c7aecc437b0b264136242e1b6cb2d6661397df00962c7e394fcffda61c1669041de7a2bd7dce02fb7e9cf40b572680e74a8f860475854a365e7c810d696ce'
        'ff80abdc280e85568e2a1c2cbcff6984344095919560e6036dd0775fd7617c7fef8791f167b9cea56ab5adc2428bbed1c726929cfaecaafa2b394f6955aee2c4'
        'fe3f0e81788c4da8746b01d421f17e757ea484b658c541632949ec7dace0b026151bcf543cde853f441785defb2029286d76257d9938e8f7b783e44c5b308112'
        '277e4e30a0357d345d87e89b6abb52d79794a55d893b2108e6cfebab628b31c299eab43378cf9c5d30922a1da453ffa06fdda08a6cbc6cb6236b2682d8b1ee0c'
        '408cac61c603f966d01df700a43bb1b8160e8e81acb9f148a5d627827ae04775237d6c6161afc86ecd8be3775a0d01bf503f6a7805f3cf0a35442cc51017e6ac'
        '970338647ace38cf89aede91f0e07caab5f43461de5c3d451ac47588ad122826f99440696fe1ea4564440c12196f5a7f552ef7ad0d8b1d63b4f63b49f7310e2e')

prepare() {
  cd "${srcdir}"
  for dep in "${_zigdepends[@]}"; do
    zig fetch --global-cache-dir "zig-global-cache" "${dep%%::*}"
  done
}

build() {
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.42
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" zig build "${zig_options[@]}"
  find "build" -type f -name '*.wasm' -delete
}

check() {
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.42
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="check" zig build test "${zig_options[@]}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -vaT --no-preserve=ownership "build" "${pkgdir}"

  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
