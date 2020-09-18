# Maintainer Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=boost-libs-171-opt
pkgver=1.71.0
pkgrel=1
pkgdesc='Free peer-reviewed portable C++ runtime libraries (installs to /opt, without numpy & python support)'
url='https://www.boost.org'
arch=('x86_64')
license=('custom')
depends=('bzip2' 'zlib' 'icu' 'zstd')
optdepends=('openmpi: for mpi support')
provides=(libboost_atomic.so
          libboost_chrono.so 
          libboost_container.so
          libboost_context.so
          libboost_contract.so
          libboost_coroutine.so
          libboost_date_time.so
          libboost_fiber.so
          libboost_filesystem.so
          libboost_graph.so
          libboost_iostreams.so
          libboost_locale.so 
          libboost_wserialization.so
          libboost_log.so
          libboost_wave.so
          libboost_math_c99.so
          libboost_math_c99f.so
          libboost_math_c99l.so
          libboost_math_tr1.so
          libboost_math_tr1f.so
          libboost_math_tr1l.so
          libboost_prg_exec_monitor.so
          libboost_program_options.so
          libboost_random.so
          libboost_regex.so
          libboost_serialization.so
          libboost_stacktrace_addr2line.so
          libboost_stacktrace_basic.so
          libboost_stacktrace_noop.so
          libboost_system.so
          libboost_thread.so
          libboost_timer.so
          libboost_type_erasure.so
          libboost_unit_test_framework.so
          ibboost_log_setup.so
          'boost-libs')
makedepends=('icu'
             'bzip2'
             'zlib'
             'openmpi'
             'zstd'
             'findutils')
source=("${pkgname}-${pkgver}.tar.gz::https://dl.bintray.com/boostorg/release/${pkgver}/source/boost_1_71_0.tar.gz")
sha256sums=('96b34f7468f26a141f6020efb813f1a2f3dfb9797ecf76a7d7cbd843cc95f5bd')

prepare() {
  cd "boost_1_71_0"
  ./bootstrap.sh
}

build() {
  cd "boost_1_71_0"
  ./b2
}

package() {
  cd "boost_1_71_0"
  install -d "${pkgdir}/opt/usr/include/"
  install -d "${pkgdir}/opt/usr/lib/"
  cp -r boost "${pkgdir}/opt/usr/include/"
  cp -r stage/lib/* "${pkgdir}/opt/usr/lib/"
  install -Dm644 LICENSE_1_0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim: ts=2 sw=2 et: