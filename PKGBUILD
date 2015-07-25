pkgname=cute
pkgver=2.0.0
_pkgver=2_0_0
_downloadid=61
pkgrel=3
pkgdesc="An easy to use C++ unit testing framework"
arch=("any")
url="http://www.cute-test.com/"
license=("LGPL")
depends=("boost-libs")
source=("http://www.cute-test.com/attachments/download/${_downloadid}/${pkgname}${_pkgver}.tar.gz")
sha256sums=('87ff94560a2fe8b978d06f40023b22c0ae9b87cf02716b019afe9f84551e14aa')

check() {
  cd ${srcdir}/cute_tests
  echo -e "\e[1m  \e[34m->\e[39m Building CUTE test suite...\e[0m"
  g++ -Wall -I../cute_lib/ main.cpp \
    test_cute.cpp \
    test_cute_data_driven.cpp \
    test_cute_equals.cpp \
    test_cute_expect.cpp \
    test_cute_filter_runner.cpp \
    test_cute_relops.cpp \
    test_cute_runner.cpp \
    test_cute_suite.cpp \
    test_cute_suite_test.cpp \
    test_cute_test.cpp \
    test_cute_test_incarnate.cpp \
    test_cute_testmember.cpp \
    test_cute_to_string.cpp \
    test_cute_to_string_embedded.cpp \
    test_repeated_test.cpp \
    test_xml_file_opener.cpp \
    test_xml_listener.cpp \
    -o test
  echo -e "\e[1m  \e[34m->\e[39m Running CUTE test suite...\e[0m"
  ./test > /dev/null
  echo -e "\e[1m  \e[34m->\e[39m OK!\e[0m"
}

package() {
  mkdir -p ${pkgdir}/usr/include/cute
  cd ${srcdir}/cute_lib/
  cp *.h ${pkgdir}/usr/include/cute/
}

# vim:set ts=2 sw=2 et:
